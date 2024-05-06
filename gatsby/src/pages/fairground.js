import * as React from 'react'
import Layout from '../components/layout'
import Seo from '../components/seo'

const IndexPage = () => {
  return (
    <Layout pageTitle="Fairground">
      <p>Think sand pit or playground and make it bigger.</p>
      <p>The goal is to build a mini web application that makes use of <a href='https://fastapi.tiangolo.com/'>FastAPI</a> and is deployed on to a monitored Kubernetes cluster in AWS. Inspired by <a href='https://github.com/kelseyhightower/kubernetes-the-hard-way'>Kubernetes the Hardway</a>, not everything will be the most efficient, but it will be more "fun".</p>
      <p>First piece of the puzzle is to build the Kubernetes AMIs for this we need packer and ansible. The repo is <a href='https://github.com/melvabout/fairground-machine-images'>fairground-machine-images</a></p>
    </Layout>
  )
}

export const Head = () => <Seo title="Fairground" />

export default IndexPage