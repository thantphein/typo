Feature: Create/ Edit Categories
  As a blog administrator
  In order to organize the posts
  I want to create and edit post according to categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    When I follow "Categories"
    And I fill in "Name" with "Name1"
    And I fill in "Keywords" with "Keywords1"
    And I fill in "Description" with "Description1"
    Then I press "Save"
    Then I should see "Category was successfully saved."
    Then I should see "Name1"

    Scenario: Check the link is working
      And I should not see "ActiveRecord"
      And I should see "Categories"
      And I should see "Name"
      And I should see "Keywords"
      And I should see "Permalink"
      And I should see "Description"

    Scenario: Create a new category
      And I fill in "Name" with "Name2"
      And I fill in "Keywords" with "Keywords2"
      And I fill in "Description" with "Description2"
      Then I press "Save"
      Then I should see "Category was successfully saved."
      Then I should see "Name2"
      Then I should see "Keywords2"
      Then I should see "Description2"

    Scenario: Edit an existing category
      And I follow "Name1"
      And I fill in "Keywords" with "Keywords11111"
      And I fill in "Description" with "Description11111"
      Then I press "Save"
      Then I should see "Category was successfully saved."
      Then I should see "Name1"
      Then I should see "Keywords11111"
      Then I should see "Description11111"

    Scenario: Successfully write articles
      And I follow "New Article"
      When I fill in "article_title" with "Foobar"
      And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
      And I check "Name1"
      And I press "Publish"
      Then I should be on the admin content page
      Then I should see "Article was successfully created"
      When I go to the home page
      Then I should see "Foobar"
      When I follow "Foobar"
      Then I should see "Lorem Ipsum"
      Then I should see "General"
