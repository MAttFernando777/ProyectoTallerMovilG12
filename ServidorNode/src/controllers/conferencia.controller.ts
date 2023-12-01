import { Request, Response} from 'express';
import connection from '../db/connection';

export const getConferencias = (req: Request, res: Response) => {
  
    connection.query('SELECT * FROM conferencia', (err, data) => {
      if(err) throw err;
      res.json(data)
    })
  }
  
  export const getConferencia = (req: Request, res: Response) => {
    const { id } = req.params
    connection.query('SELECT * FROM conferencia WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json(data[0])
    })
  }
  
  export const deleteConferencia = (req: Request, res: Response) => {
    const { id } = req.params
  
    connection.query('DELETE FROM conferencia WHERE id = ?', id, (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Conferencia eliminada con éxito"
      })
    })
  }
  
  export const postConferencia = (req: Request, res: Response) => {
    const { body } = req;
  
    connection.query('INSERT INTO conferencia set ?',[body], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Conferencia agregada con éxito"
      })
    })
  }
  
  export const putConferencia = (req: Request, res: Response) => {
    const { body } = req;
    const { id } = req.params
  
    connection.query('UPDATE conferencia set ? WHERE id = ?', [body, id], (err, data) => {
      if(err) throw err;
      res.json({
        msg: "Conferencia actualizada con éxito"
      })
    })
  }