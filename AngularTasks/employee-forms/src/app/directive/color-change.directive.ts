import { Directive, ElementRef, HostListener } from '@angular/core';

@Directive({
  selector: '[appColorChange]',
  standalone: true
})
export class ColorChangeDirective {

  constructor(private el:ElementRef) {}

  @HostListener('mouseenter') onMouseEnter(){
    this.el.nativeElement.style.background = "blue";
  }

  @HostListener('mouseleave') onMouseLeave(){
    this.el.nativeElement.style.background = "";
  }
 
}
