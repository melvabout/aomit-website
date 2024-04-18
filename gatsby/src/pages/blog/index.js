import * as React from 'react'
import Layout from '../../components/layout'
import { Link, graphql } from 'gatsby'
import Seo from '../../components/seo'
import { navLinkText } from '../../components/layout.module.css'

const BlogPage = ({ data }) => {
  return (
    <Layout pageTitle="Blog Posts">
      {
        data.allMdx.nodes.map((node) => (
          <article key={node.id}>
            <h2>
              <Link to={`/blog/${node.frontmatter.slug}`} className={navLinkText}>
                {node.frontmatter.name}
              </Link>
            </h2>
            <p>Posted: {node.frontmatter.datePublished}, by: {node.frontmatter.author}</p>
            <p>{node.excerpt}</p>
          </article>
        ))
      }
    </Layout>
  )
}

export const query = graphql`
  query MyQuery {
    allMdx(sort: {frontmatter: {datePublished: DESC}}) {
      nodes {
        frontmatter {
          datePublished(formatString: "Mo MMMM, YYYY")
          name
          author
          authorEmail
          slug
        }
        id
        excerpt
      }
    }
  }
`

export const Head = () => <Seo title="Blog" />

export default BlogPage
