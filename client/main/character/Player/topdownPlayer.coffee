define ['Phaser'], (Phaser) ->

  class TopdownPlayer extends Phaser.Sprite
    constructor: (@game, x, y, frame) ->
      ## create character
      super @game, x, y, 'player', frame

      @game.physics.arcade.enable this
      @game.camera.follow this
      @anchor.setTo 0.5, 0.5

      @animations.add 'walkdown', [0,1,2], 6, true
      @animations.add 'walkup', [36,37,38], 6, true
      @animations.add 'walkright', [24,25,26], 6, true
      @animations.add 'walkleft', [12,13,14], 6, true
      @currrentAnimation = null

      return

    goUp: ->
      @body.velocity.y -= 100
      @animations.play 'walkup'
      @currrentAnimation = 'walkup'
      return

   	goDown: ->
      @body.velocity.y += 100
      @animations.play 'walkdown'
      @currrentAnimation = 'walkdown'



   	goLeft: ->
      @body.velocity.x -=100
      @animations.play 'walkleft'
      @currrentAnimation = 'walkleft'


   	goRight: ->
      @body.velocity.x += 100
      @animations.play 'walkright'
      @currrentAnimation = 'walkright'

    stay: ->
      @animations.stop @currrentAnimation, false
      return






