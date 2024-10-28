import { Directive, Input, TemplateRef, ViewContainerRef } from '@angular/core';
@Directive({
  selector: '[appDisplayEmail]',
  standalone: true
})
export class DisplayEmailDirective {

  constructor(
    private templateRef: TemplateRef<any>,
    private viewContainer: ViewContainerRef) { }

  @Input() set appDisplayEmail(email:string) {
    if (email.includes('@gmail.com')) {
      this.viewContainer.createEmbeddedView(this.templateRef);
      
    } else {
      this.viewContainer.clear();
    
    }
  }

}
