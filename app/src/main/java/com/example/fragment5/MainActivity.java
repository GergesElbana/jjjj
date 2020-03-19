package com.example.fragment5;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    Fragment fragnent = null;
    Button chat,status,call;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
     chat=(Button)findViewById(R.id.chat);
     status=(Button)findViewById(R.id.status);
     call=(Button)findViewById(R.id.call);
    }


    public void onClick (View view){

        switch (view.getId()){
            case R.id.chat:
                fragnent=new fragmentone();

                loadFragment(fragnent);
                break;
            case R.id.status:
                fragnent =new fragmenttwo();
                loadFragment(fragnent);
                break;
            case R.id.call:
                fragnent =new fragmentthree();
                loadFragment(fragnent);
                break;
        }

    }

    private void loadFragment(Fragment fragment){
        FragmentManager manger=getSupportFragmentManager();
        FragmentTransaction transaction=manger.beginTransaction();
        transaction.replace(R.id.Container,fragment);
        transaction.commit();

    }

}
