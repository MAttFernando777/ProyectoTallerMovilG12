import { TestBed } from '@angular/core/testing';

import { ConvocatoriaService } from './convocatoria.service';

describe('ConvocatoriaService', () => {
  let service: ConvocatoriaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ConvocatoriaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
