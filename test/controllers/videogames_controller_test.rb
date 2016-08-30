require 'test_helper'

class VideogamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @videogame = videogames(:one)
  end

  test "should get index" do
    get videogames_url
    assert_response :success
  end

  test "should get new" do
    get new_videogame_url
    assert_response :success
  end

  test "should create videogame" do
    assert_difference('Videogame.count') do
      post videogames_url, params: { videogame: { description: @videogame.description, publisher: @videogame.publisher, rating: @videogame.rating, title: @videogame.title, videogame_difficulty: @videogame.videogame_difficulty } }
    end

    assert_redirected_to videogame_url(Videogame.last)
  end

  test "should show videogame" do
    get videogame_url(@videogame)
    assert_response :success
  end

  test "should get edit" do
    get edit_videogame_url(@videogame)
    assert_response :success
  end

  test "should update videogame" do
    patch videogame_url(@videogame), params: { videogame: { description: @videogame.description, publisher: @videogame.publisher, rating: @videogame.rating, title: @videogame.title, videogame_difficulty: @videogame.videogame_difficulty } }
    assert_redirected_to videogame_url(@videogame)
  end

  test "should destroy videogame" do
    assert_difference('Videogame.count', -1) do
      delete videogame_url(@videogame)
    end

    assert_redirected_to videogames_url
  end
end
