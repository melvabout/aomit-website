import * as React from 'react'
import Layout from '../components/layout'
import Seo from '../components/seo'

const IndexPage = () => {
  return (
    <Layout pageTitle="Fairground">
      <p>Think sand or playground and make it bigger.</p>
      <p>The goal is to build a mini web application that makes use of [FastAPI](https://fastapi.tiangolo.com/) and is deployed on to a monitored Kubernetes cluster in AWS. Inspired by [Kubernetes the Hardway](https://github.com/kelseyhightower/kubernetes-the-hard-way), not everything will be the most efficient, but it will be more "fun".</p>
      <p>First piece of the puzzle is to build the Kubernetes AMIs for this we need packer and ansible. The repo is [fairground-machine-images](https://github.com/melvabout/fairground-machine-images)</p>
    </Layout>
  )
}

export const Head = () => <Seo title="Fairground" />

export default IndexPage