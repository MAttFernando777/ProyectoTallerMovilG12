import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentanaNoticiasComponent } from './ventana-noticias.component';

describe('VentanaNoticiasComponent', () => {
  let component: VentanaNoticiasComponent;
  let fixture: ComponentFixture<VentanaNoticiasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VentanaNoticiasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VentanaNoticiasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
