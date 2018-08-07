// Browse
//     onClick(e) {
//         this.setState(selectedAuctionId: e.auction.id)
//     }

//     renderBidForm() {
//         if (this.state.selectedAuctionId) {
//             <BidformContainer />
//         }
//     }

//     render() {
//        <div>
//          <AuctionIndex onClick={this.onClick} />
//          {
//              this.renderBidForm()
//          }
//        </div> 
//     }

// AuctionIndex
//     render() {
//        <div>
//         {this.props.auctions.forEach((a) => {
//             <AuctionDetail onClick={this.props.onClick} auction={a} />
//         })
//         }
//        </div> 
//     }

// AuctionDetail
//     render() {
//        <div onClick={this.props.onClick}>
//          {this.props.auction.info} 
//        </div> 
//     }