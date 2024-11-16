const pool = require("../config/db")


function selectAllPosts() {
    return pool.query(
        "select posts.*, autores.nombre as autor_nombre, autores.email as autor_email, autores.imagen as autor_imagen from posts join autores on autor_id = idautores"  
    )
}

function selectByPostId(postId) {
    return pool.query(
        "select * from posts where idposts = ?", 
        [postId])
}

function findPostByTitle (postTitle) {
    return pool.query(
        "select * from posts where titulo = ?",
        [postTitle]
    )
}

function selectByAuthorId(authorId) {
    return pool.query(
        "select * from posts where autor_id = ?", [authorId]
    )
}

function insertPost({titulo, descripcion, categoria, autor_id}) {
    return pool.query(
        "insert into posts (titulo, descripcion, categoria, autor_id) values (?, ?, ?, ?)", 
        [titulo, descripcion, categoria, autor_id]
    )
}


module.exports = {
    selectAllPosts, insertPost, selectByPostId, selectByAuthorId, findPostByTitle
}