import { Request, Response} from 'express';
import connection from '../db/connection';

export const getPacientes = (req: Request, res: Response) => {
  
  connection.query('SELECT * FROM paciente', (err, data) => {
    if(err) throw err;
    res.json(data)
  })
}

export const getDepartamentos = (req: Request, res: Response) => {
  
  connection.query('SELECT * FROM departamento', (err, data) => {
    if(err) throw err;
    res.json(data)
  })
}

export const getPaciente = (req: Request, res: Response) => {
  const { id } = req.params
  connection.query('SELECT * FROM paciente WHERE id = ?', id, (err, data) => {
    if(err) throw err;
    res.json(data[0])
  })
}

export const deletePaciente = (req: Request, res: Response) => {
  const { id } = req.params

  connection.query('DELETE FROM paciente WHERE id = ?', id, (err, data) => {
    if(err) throw err;
    res.json({
      msg: "Paciente eliminado con éxito"
    })
  })
}

export const postPaciente = (req: Request, res: Response) => {
  const { body } = req;

  connection.query('INSERT INTO paciente set ?',[body], (err, data) => {
    if(err) throw err;
    res.json({
      msg: "Paciente agregado con éxito"
    })
  })
}

export const putPaciente = (req: Request, res: Response) => {
  const { body } = req;
  const { id } = req.params

  connection.query('UPDATE paciente set ? WHERE id = ?', [body, id], (err, data) => {
    if(err) throw err;
    res.json({
      msg: "Persona actualizada con éxito"
    })
  })
}

