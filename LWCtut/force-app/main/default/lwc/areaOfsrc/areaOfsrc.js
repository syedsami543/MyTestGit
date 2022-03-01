import { LightningElement,track } from 'lwc';

export default class AreaOfsrc extends LightningElement {
    @track currentOutput;
    side;
    length;
    breadth;
    radius;
    sideHandler(event){
        this.side=parseInt(event.target.value);
    }
    lengthHandler(event){
        this.length=parseInt(event.target.value);
    }
    breadthHandler(event){
        this.breadth=parseInt(event.target.value);
    }
    radiusHandler(event){
        this.radius=parseInt(event.target.value);
    }
    squareHandler(event){
        this.currentOutput='Area of Square ='+(this.side*this.side);
    }
    rectangleHandler(event){
        this.currentOutput='Area of Rectangle ='+(this.length*this.breadth);
    }
    circleHandler(event){
        this.currentOutput='Area of Circle ='+(3.14*(this.radius*this.radius));
    }

}