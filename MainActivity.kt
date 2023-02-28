package com.example.calculatorapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_main.*
import net.objecthunter.exp4j.Expression
import net.objecthunter.exp4j.ExpressionBuilder
import java.lang.Exception
import kotlin.Result

class MainActivity : AppCompatActivity() {



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        bu1.setOnClickListener{ appendExpression("1",clear = true)}
        bu2.setOnClickListener{ appendExpression("2",clear = true)}
        bu3.setOnClickListener{ appendExpression("3",clear = true)}
        bu4.setOnClickListener{ appendExpression("4",clear = true)}
        bu5.setOnClickListener{ appendExpression("5",clear = true)}
        bu6.setOnClickListener{ appendExpression("6",clear = true)}
        bu7.setOnClickListener{ appendExpression("7",clear = true)}
        bu8.setOnClickListener{ appendExpression("8",clear = true)}
        bu9.setOnClickListener{ appendExpression("9",clear = true)}
        bu0.setOnClickListener{ appendExpression("0",clear = true)}
        buD.setOnClickListener{ appendExpression(".",clear = true)}


        // operators
        buSum.setOnClickListener{ appendExpression("+",clear = false)}
        buDiv.setOnClickListener{ appendExpression("÷",clear = false)}
        buPer.setOnClickListener{ appendExpression("%",clear = false)}
        buMul.setOnClickListener{ appendExpression("x",clear = false)}
        buSub.setOnClickListener{ appendExpression("-",clear = false)}
        buAC.setOnClickListener{
            Show.text=""
            Result.text=""}

        buEqual.setOnClickListener{
            try{
val expression = ExpressionBuilder(Result.text.toString()).build()
                val res= expression.evaluate()
                val longResult = res.toLong()
                if (res == longResult.toDouble()){
                    Result.text=longResult.toString()

                }
                else
                    Result.text=res.toString()
            }
            catch (e:Exception){

            }
        }
    }
    fun appendExpression(str: String, clear: Boolean){
//        if(Result.text.isNotEmpty()){
//            Show.text=""
//        }
        if(clear){
            Result.text =" "
            Show.append(str)

        }
        else{
            Show.append(Result.text)
            Show.append(str)
            Result.text  = ""
        }
    }
}