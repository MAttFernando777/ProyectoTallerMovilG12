import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConferenciasComponent } from './conferencias.component';

describe('ConferenciasComponent', () => {
  let component: ConferenciasComponent;
  let fixture: ComponentFixture<ConferenciasComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConferenciasComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConferenciasComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
