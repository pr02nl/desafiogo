FROM golang:1.19.5 as builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /desafiogo main.go

FROM scratch AS runner

WORKDIR /app

COPY --from=builder /desafiogo .

CMD [ "./desafiogo" ]