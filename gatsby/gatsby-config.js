/**
 * @type {import('gatsby').GatsbyConfig}
 */
module.exports = {
  siteMetadata: {
    title: `AOM IT`,
    siteUrl: `https://aomit.co.uk`
  },
  plugins: [
    "gatsby-plugin-styled-components",
  {
    resolve: "gatsby-source-filesystem",
    options: {
      name: `blog`,
      path: `${__dirname}/blog`,
    }
  },
  "gatsby-plugin-mdx",
]
};