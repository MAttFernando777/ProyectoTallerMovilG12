import { Router } from 'express';
import { deleteNoticia, getNoticia, getNoticias, postNoticia, putNoticia } from '../controllers/noticia.controller';



const router = Router();

router.get('/', getNoticias);
router.get('/:id', getNoticia);
router.delete('/:id', deleteNoticia);
router.post('/', postNoticia);
router.put('/:id', putNoticia);



export default router;