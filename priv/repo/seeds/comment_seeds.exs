alias Todo.Repo
alias Todo.MyComments.Comment

Repo.insert!( %Comment{
    title: "A New Awesome Post",
    description: "Where is some more.."
})

Repo.insert!( %Comment{
    title: "Some More",
    description: "Wait, Waht?! Awesome !"
})
