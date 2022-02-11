import React from 'react'
import { Container, Grid, Header, Segment } from 'semantic-ui-react'
import BookItem from '../components/BookItem'
import { Book } from '../tipovi'

interface Props {
    books: Book[],
}

export default function Home(props: Props) {
    return (
        <Container>

            <Header textAlign='center'>
                <h1>Welcome to our library</h1>
            </Header>

            <Segment>

                <Header textAlign='center'>
                    <h2>Check out some of our books</h2>
                </Header>
            </Segment>
            <Segment >
                <Grid padded columns='16'>
                    <Grid.Row columns='16'>
                        {
                            props.books.map(element => {
                                return (
                                    <Grid.Column width='4'>
                                        <BookItem book={element} />
                                    </Grid.Column>
                                )
                            })
                        }
                    </Grid.Row>

                </Grid>
            </Segment>
        </Container>
    )
}
