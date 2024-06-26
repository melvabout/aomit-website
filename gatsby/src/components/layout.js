import * as React from 'react'
import { Link, useStaticQuery, graphql } from 'gatsby'
import {
  container,
  innerContainer,
  heading,
  navLinks,
  navLinkItem,
  navLinkText,
  siteTitle,
  mlAuto,
  titleContainer,

} from './layout.module.css'

const Layout = ({ pageTitle, children }) => {
  const data = useStaticQuery(graphql`
      query {
        site {
          siteMetadata {
            title
          }
        }
      }
    `)

  return (
    <div className={container}>   
      <div className={titleContainer}>
        <header className={siteTitle}>{data.site.siteMetadata.title}</header>
      </div>
      <div className={innerContainer}>
      <nav>
        <div className={navLinks}>
          <div className={[navLinkItem, mlAuto].join(" ")}><Link to="/" className={[navLinkText, mlAuto].join(" ")}>
            Home
          </Link></div>
          <div className={navLinkItem}><Link to="/blog" className={navLinkText}>
            Blog
          </Link></div>
          <div className={navLinkItem}><Link to="/fairground" className={navLinkText}>
            Fairground
          </Link></div>
        </div>
      </nav>
      <main>
        <h1 className={heading}>{pageTitle}</h1>
        {children}
      </main>
      </div>
      <br />
      <footer>
      <div className={innerContainer}>
        <div>Email: <a href="mailto:andy@aomit.co.uk">andy@aomit.co.uk</a></div>
        <div>LinkedIn: <a href="https://www.linkedin.com/in/andrew-melvin-a53b657b">Andrew Melvin</a></div>
        <div>GitHub: <a href="https://github.com/melvabout">melvabout</a></div>
      </div>
      </footer>
    </div>
  )
}

export default Layout