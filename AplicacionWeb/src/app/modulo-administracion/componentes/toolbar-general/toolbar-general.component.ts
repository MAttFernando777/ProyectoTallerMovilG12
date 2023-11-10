import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-toolbar-general',
  templateUrl: './toolbar-general.component.html',
  styleUrls: ['./toolbar-general.component.css']
})
export class ToolbarGeneralComponent {
  @Output() private cambiarEstadoMenu = new EventEmitter<boolean>;
  
  public CambiarEstadoMenu() {
    this.cambiarEstadoMenu.emit();
  }
}
