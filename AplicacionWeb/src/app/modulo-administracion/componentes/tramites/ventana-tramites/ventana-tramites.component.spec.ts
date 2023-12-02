import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VentanaTramitesComponent } from './ventana-tramites.component';

describe('VentanaTramitesComponent', () => {
  let component: VentanaTramitesComponent;
  let fixture: ComponentFixture<VentanaTramitesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VentanaTramitesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VentanaTramitesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
