import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentanaConvocatoriaComponent } from './ventana-convocatoria.component';

describe('VentanaConvocatoriaComponent', () => {
  let component: VentanaConvocatoriaComponent;
  let fixture: ComponentFixture<VentanaConvocatoriaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VentanaConvocatoriaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VentanaConvocatoriaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
