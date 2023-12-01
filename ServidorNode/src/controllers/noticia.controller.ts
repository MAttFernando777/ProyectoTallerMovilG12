import { Request, Response} from 'express';
import connection from '../db/connection';

export const getNoticias = (req: Request, res: Response) => {
  
    connection.query('SELECT * FROM noticia', (err, data) => {
      if(err) throw err;
      res.json(data)
    })
  }
  
  export const getNoticia = (req: Request, res: Response) => {
    const { id } = req.params
    connection.query('SELECT * FROM noticia WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json(data[0])
    })
  }
  
  export const deleteNoticia = (req: Request, res: Response) => {
    const { id } = req.params
  
    connection.query('DELETE FROM noticia WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Noticia eliminada con éxito"
      })
    })
  }
  
  export const postNoticia = (req: Request, res: Response) => {
    const { body } = req;
  
    connection.query('INSERT INTO noticia set ?',[body], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Noticia agregada con éxito"
      })
    })
  }
  
  export const putNoticia = (req: Request, res: Response) => {
    const { body } = req;
    const { id } = req.params
  
    connection.query('UPDATE noticia set ? WHERE id = ?', [body, id], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Noticia actualizada con éxito"
      })
    })
  }