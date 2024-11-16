const { selectById } = require("../models/autores.model")
const { selectAllPosts, insertPost, selectByPostId, selectByAuthorId, findPostByTitle } = require("../models/posts.model")


const getAllPosts = async (req, res, next) => {
    try {
        const [posts] = await selectAllPosts()
        res.json(posts)
    } catch (error) {
        next(error)
    }
}

const getPostById = async (req, res, next) => {
    try {
        const authorId = req.params.authorId

        //Obtengo datos del autor, si existe
        const [result] = await selectById(authorId)
        const author = result[0]

        if(!author) {
            return res.status(404).json({ message: "No se ha encontrado el autor." })
        }
        
        //Obtengo posts del autor
        const posts = await selectByAuthorId(authorId)

        author.post = posts[0]

        res.json(author)
    } catch (error) {
        next(error)
    }
}

const createPosts = async (req, res, next) => {
    try {
        const { titulo, descripcion, autor_id } = req.body
        
        //Valido campos obligatorios
        if(!titulo || !descripcion || !autor_id) {
            return res.status(400).json({ message: "Rellena los campos."})
        }

        //Valido si existe el autor para asignarle el post
        const [authorExists] = await selectById(autor_id)
            if(!authorExists.length){
            return res.status(400).json({ message: "El autor no existe." })
        }

        //Valido si el post está duplicado
        const [postExists] = await findPostByTitle(titulo)
            if(postExists.length){
                return res.status(400).json({ message: "El título ya existe."})
            }

        //Inserto post
        const [result] = await insertPost(req.body)

        //Recupero post
        const [post] = await selectByPostId(result.insertId)

        res.json(post)
    } catch (error) {
        next(error)
    }
}


module.exports = {
    getAllPosts, createPosts, getPostById
}