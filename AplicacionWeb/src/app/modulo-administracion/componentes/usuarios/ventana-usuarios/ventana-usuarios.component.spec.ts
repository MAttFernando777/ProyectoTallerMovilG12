import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentanaUsuariosComponent } from './ventana-usuarios.component';

describe('VentanaUsuariosComponent', () => {
  let component: VentanaUsuariosComponent;
  let fixture: ComponentFixture<VentanaUsuariosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VentanaUsuariosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VentanaUsuariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
