package com.example.gena.squldatabase;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;
import java.util.List;

public class sqldatabaseHelper {

            // for super constractor in inner class

  private final int Db_vir=1;
  private Context context;
  private final String DATABASENAME="GENA_DB";
  private String TABELNAME ="QUSTION";
  private SQLiteDatabase database;
      //key of ading data
     private String ans1="ANSWER1";
     private String ans2="ANSWER2";
     private String ans3="ANSWER3";
     private String ans4="ANSWER4";
     private String Rans="ANSWER2";
     private String qus="RIGHTANSWER";

                 //singel toon pattern
    private sqldatabaseHelper (){
    }


      private static sqldatabaseHelper object;

    public static synchronized   sqldatabaseHelper getInstance(){
           if (object==null)
           {
               object=new sqldatabaseHelper();
           }
           return object;

    }
    helper helper;
    // i use it to add data
    public boolean AddtoDatabas(QusSample sample){
        ContentValues values=new ContentValues();
        values.put("qus",sample.getQus());
        values.put("ans1",sample.getAns1());
        values.put("ans2",sample.getAns2());
        values.put("ans3",sample.getAns3());
        values.put("ans4",sample.getAns4());
        values.put("rans",sample.getR_ans());
        return    database.insert(TABELNAME,null,values)!=-1;

   }
// i use it to retreive data
   public List<QusSample> getqus(){

        List<QusSample> reternedlist =new ArrayList<>();
        QusSample qs;
       Cursor cr=database.rawQuery("SELECT * FROM "+TABELNAME,null);
       cr.moveToFirst();
        while (cr.isAfterLast()) {
            qs = new QusSample();
            qs.setQus(cr.getString(qus));
            qs.setAns1(cr.getString(2));
            qs.setAns2(cr.getString(3));
            qs.setAns3(cr.getString(4));
            qs.setAns4(cr.getString(5));
            qs.setR_ans(cr.getString(6));
            rete