require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:first)
  end

  test 'create a new post' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'

    click_on 'New post'
    assert_selector 'h1', text: 'New post'

    fill_in 'Name', with: 'Today i start a new project'
    click_on 'Create post'

    assert_selector 'h1', text: 'Posts'
    assert_text 'Today i start a new project'
  end

  test 'showing a post' do
    visit posts_path
    click_link @post.name

    assert_selector 'h1', text: @post.name
  end

  test 'updating a post' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'

    click_on 'Edit', match: :first
    assert_selector 'h1', text: 'Edit post'

    fill_in 'Name', with: 'Updated post'
    click_on 'Update post'

    assert_selector 'h1', text: 'Posts'
    assert_text 'Updated post'
  end

  test 'Destroying a post' do
    visit posts_path
    assert_text @post.name

    click_on 'Delete', match: :first
    assert_no_text @post.name
  end
end
