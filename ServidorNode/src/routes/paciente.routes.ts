import { Router } from 'express';
import { deletePaciente, getPaciente, getPacientes, postPaciente, putPaciente } from '../controllers/paciente.controller';



const router = Router();

router.get('/', getPacientes);
router.get('/:id', getPaciente);
router.delete('/:id', deletePaciente);
router.post('/', postPaciente);
router.put('/:id', putPaciente);



export default router;