import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentanaConferenciasComponent } from './ventana-conferencias.component';

describe('VentanaConferenciasComponent', () => {
  let component: VentanaConferenciasComponent;
  let fixture: ComponentFixture<VentanaConferenciasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VentanaConferenciasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VentanaConferenciasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
