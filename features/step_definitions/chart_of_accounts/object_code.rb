And /^I create an Object Code document$/ do
  @object_code = create ObjectCodeObject
end

When /^I Blanket Approve the document$/ do
  on(ObjectCodePage).blanket_approve
end

Then /^I should see the Object Code document in the object code search results$/ do
  visit(MainPage).object_code

  on ObjectCodeLookupPage do |page|
    page.object_code.fit @object_code.object_code
    page.search
    page.find_item_in_table(@object_code.object_code.upcase).should exist
  end
end

And /^I edit an Object Code document with object code (.*)$/ do |the_object_code|
  @object_code = make ObjectCodeObject

  visit(MainPage).object_code

  on ObjectCodeLookupPage do |page|
    page.object_code.set the_object_code
    page.search
    page.edit_item(the_object_code)
  end
end

And /^I enter invalid CG Reporting Code of (.*)$/ do |the_reporting_code|
  on ObjectCodePage do |page|
    page.description.set @object_code.description
    page.cg_reporting_code.set the_reporting_code
  end
end

Then /^The object code should show an error that says "(.*?)"$/ do |error|
  on(ObjectCodePage).errors.should include error
end


And /^I edit an Object Code$/ do
  visit(MainPage).object_code
  on ObjectCodeLookupPage do |page|
    page.search
    page.edit_random
  end
  on ObjectCodePage do |page|
    @objectCode = make ObjectCodeObject
    page.description.set random_alphanums(40, 'AFT')
    @objectCode.document_id = page.document_id
  end
end

And /^I update the Financial Object Code Descripton$/ do
  on(ObjectCodePage).financial_object_code_description.set random_alphanums(60, 'AFT')
end