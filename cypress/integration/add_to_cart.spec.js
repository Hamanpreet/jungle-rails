describe('test cart features', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("users can click the 'Add to Cart' button for a product", () => {
    cy.get(".products div")
    .first()
    .find("button.btn")
    .should('exist')
    .click({ force: true });

    cy.visit('/cart')
    cy.get("td div")
    .should('contain', '1')
  
  });
 
})