describe('test naviagtion', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("users can navigate from the home page to the product detail page", () => {
    cy.get(".products article")
    .first()
    .click()
  });
 
})