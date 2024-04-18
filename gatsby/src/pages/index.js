import * as React from 'react'
import Layout from '../components/layout'
import Seo from '../components/seo'

const IndexPage = () => {
  return (
    <Layout pageTitle="Welcome 127.0.0.1/32!">
      <p>Empower your digital infrastructure with expert Site Reliability Engineering and DevOps solutions. We will optimize your systems for reliability, scalability, and efficiency.</p>
    </Layout>
  )
}

export const Head = () => <Seo title="Home Page" />

export default IndexPage