models = require '../lib/models'
models.sequelize
  .sync {force: true}
  .complete (err) ->
    if err?
      console.log "An error occurred while creating the table", err
    else
      console.log "Initialized tables."