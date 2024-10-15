import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { IEmployee } from '../models/employee';


@Component({
  selector: 'app-employee-details',
  standalone: true,
  imports: [ReactiveFormsModule,CommonModule],
  templateUrl: './employee-details.component.html',
  styleUrl: './employee-details.component.scss'
})

export class EmployeeDetailsComponent implements OnInit {

  employeeForm:FormGroup<IEmployee>;
  
  
  ngOnInit(){
    this.employeeForm = new FormGroup<IEmployee>({
      firstname: new FormControl(null,Validators.required),
      lastname:new FormControl(null),
      email: new FormControl(null,[Validators.required,Validators.email]),
      pNumber: new FormControl(null,[Validators.required,Validators.minLength(10),Validators.pattern(/^\d{1,10}$/)]),
      address:new FormGroup({
        address1:new FormControl(null),
        address2:new FormControl(null),
        city:new FormControl(null)
      })
    })
  }
  

  data:any;


  onSubmit()
    {
      if(this.employeeForm.valid)
      {
        this.display();
      }

    }

  display()
  {
    this.data=this.employeeForm.value;
  }


}
