import { TestBed } from '@angular/core/testing';

import { ConferenciaService } from './conferencia.service';

describe('ConferenciaService', () => {
  let service: ConferenciaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ConferenciaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
