express = require 'express'
router = express.Router()
passport_config  = require('../lib/auth')

index_controller = require '../lib/controllers/index_controller'
user_controller = require '../lib/controllers/user_controller'
image_controller = require '../lib/controllers/image_controller'
comment_controller = require '../lib/controllers/comment_controller'

# GET home page
router.get '/', passport_config.isAuthenticated, index_controller.get_index
router.get '/page/:page_num',passport_config.isAuthenticated, index_controller.get_index_page

# User routes
router.get '/user/create', user_controller.get_user_create
router.post '/user/create', user_controller.post_user_create
router.get '/user/login', user_controller.get_user_login
router.post '/user/login', user_controller.post_user_login
router.get '/user/logout', user_controller.get_user_logout
router.get '/user/:user_id/uploaded',passport_config.isAuthenticated,
  user_controller.get_user_uploaded
router.get '/user/password', passport_config.isAuthenticated, user_controller.get_change_password
router.post '/user/password', passport_config.isAuthenticated, user_controller.post_change_password

# Logged in image routes
router.get '/image/upload', passport_config.isAuthenticated, image_controller.get_upload
router.post '/image/upload', passport_config.isAuthenticated, image_controller.post_upload
router.get '/image/:image_id/up', passport_config.isAuthenticated, image_controller.get_upvote
router.get '/image/:image_id/down', passport_config.isAuthenticated, image_controller.get_downvote
router.get '/image/:image_id/delete', passport_config.isAuthenticated, image_controller.get_delete

# Public image routes
router.get '/image/:image_id', passport_config.isAuthenticated,image_controller.get_image
router.get '/image/:image_id/next', passport_config.isAuthenticated,image_controller.get_next
router.get '/image/:image_id/previous',passport_config.isAuthenticated,
  image_controller.get_previous

# Image commenting routes
router.post '/comment/create', passport_config.isAuthenticated, comment_controller.post_comment
router.get '/comment/:comment_id/delete', passport_config.isAuthenticated,
  comment_controller.get_delete
router.get '/image/:image_id/comments', passport_config.isAuthenticated,
  comment_controller.get_comments_for_image

module.exports = router
