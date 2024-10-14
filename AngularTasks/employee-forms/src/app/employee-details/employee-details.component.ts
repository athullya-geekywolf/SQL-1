import { Component } from '@angular/core';
import { FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Employee } from '../models/employee';

@Component({
  selector: 'app-employee-details',
  standalone: true,
  imports: [ReactiveFormsModule,CommonModule],
  templateUrl: './employee-details.component.html',
  styleUrl: './employee-details.component.scss'
})

export class EmployeeDetailsComponent {

  employeeForm:FormGroup;
  
  constructor(){
    this.employeeForm = new FormGroup({
      'firstname': new FormControl(null,Validators.required),
      'lastname':new FormControl(null),
      'email': new FormControl(null,[Validators.required,Validators.email]),
      'pNumber': new FormControl(null,[Validators.required,Validators.minLength(10),Validators.pattern(/^\d{1,10}$/)]),
      'address':new FormGroup({
        'address1':new FormControl(null),
        'address2':new FormControl(null),
        'city':new FormControl(null)
      })
    })
  }
  

  data:Employee|null=null;


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
