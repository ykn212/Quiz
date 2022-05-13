//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["すばるの通っている学部は？", "経済学部", "社会情報学部", "体育・健康学部", 2])
        quizArray.append(["すばるの好きな科目は？", "数学", "社会", "理科", 1])
        quizArray.append(["すばるの入っているサークルは？", "バドミントン", "ダンス", "アカペラ", 3])
        quizArray.append(["すばるが大学で選択している第二外国語は？", "韓国語", "中国語", "フランス語", 1])
        quizArray.append(["すばるの好きな歌手は？", "福山雅治", "平井大", "平井堅", 2])
        quizArray.append(["すばるの好きな色は？", "紫", "白", "青", 3])
        quizArray.append(["すばるの好きなK-POPアイドルは？", "Kep1er", "TWICE", "IVE", 1])
        quizArray.append(["すばるが1番長くやっていた習い事は？", "ピアノ", "体操", "水泳", 3])
        quizArray.append(["すばるの好きな服装は？", "フレンチガーリー", "定番カジュアル", "韓国ストリート", 3])
        quizArray.append(["すばるが受験生の時に通っていた予備校は？", "河合塾", "駿台", "東進", 1])
        quizArray.append(["すばるが1番好きなチョコレートのメーカは？", "GODIVA", "Rindt", "PIERRE MARCOLINI", 2])
        //------------------------ここから上にクイズを書く------------------------//

        //quizArrayの中身をシャッフルする
        quizArray.shuffle()
        
        choiceQuiz()
        
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


