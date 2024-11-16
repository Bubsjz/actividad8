const { selectAllAuthors, insertAuthor, selectById, selectByEmail } = require("../models/autores.model")


const getAllAuthors = async (req, res, next) => {
    try {
       const result =  await selectAllAuthors()
       const author = result[0]
       res.json(author)
    } catch (error) {
        next(error)
    }
}

const createAuthors = async (req, res, next) => {
    try {
        const { nombre, email } = req.body

        //Valido campos obligatorios
        if(!nombre || !email) {
            return res.status(400).json({ message: "Rellena los campos."})
        }

        //Valido si el autor está duplicado
        const [authorExists] = await selectByEmail(email)
        if(authorExists[0]) {
            return res.status(400).json({ message: "Autor duplicado" })
        }

        //Inserto autor
        const [result] = await insertAuthor(req.body)

        //Recupero autor
        const [author] = await selectById(result.insertId)

        res.json(author)
    } catch (error) {
        next(error)
    }
}


module.exports = {
    getAllAuthors, createAuthors
}