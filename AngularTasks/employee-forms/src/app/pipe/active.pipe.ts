import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'active',
  standalone: true
})
export class ActivePipe implements PipeTransform {

  transform(value: any,state:boolean): any{
    if(value)
    {
      return value.filter((p :any)=>p.isActive===state);
    }
    
  }

}
