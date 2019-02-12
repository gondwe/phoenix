alias Todo.Repo
alias Todo.MyComments.File

Repo.insert! %File{
    name: "Special Comment",
    viewcount: 10,
    published: true,
    comments_id: 2
}

Repo.insert! %File{
    name: "This isnt important though",
    viewcount: 3,
    published: false,
    comments_id: 1
}

Repo.insert! %File{
    name: "Cmon this is great stuff",
    viewcount: 3,
    published: false,
    comments_id: 1
}