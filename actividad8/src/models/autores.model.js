const pool = require("../config/db")


function selectAllAuthors() {
    return pool.query("select * from autores")
}

function selectById(id) {
    return pool.query("select * from autores where idautores = ?", [id])
}

function selectByEmail(email) {
    return pool.query("select * from autores where email = ?", [email])
}

function insertAuthor({nombre, email, imagen}) {
    return pool.query(
        "insert into autores (nombre, email, imagen) values (?, ?, ?)", [nombre, email, imagen]
    )
}


module.exports = {
    selectAllAuthors, insertAuthor, selectById, selectByEmail
}