import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ToolbarGeneralComponent } from './toolbar-general.component';

describe('ToolbarGeneralComponent', () => {
  let component: ToolbarGeneralComponent;
  let fixture: ComponentFixture<ToolbarGeneralComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToolbarGeneralComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ToolbarGeneralComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
