import { LightningElement,track } from 'lwc';
import circleArea from '@salesforce/apex/CaluclateArea.circleArea'
import squareArea from '@salesforce/apex/CaluclateArea.squareArea'
import rectangleArea from '@salesforce/apex/CaluclateArea.rectangleArea'

export default class ApexlwcExam extends LightningElement {
    @track res;
    length;
    breadth;
    side;
    radius;
    caluclateHandler(){
        circleArea({radius:this.radius}).then(result=>{
            this.res=result;
        });  
        squareArea({side:this.side}).then(result=>{
            this.res=result;
        });
        rectangleArea({length:this.length,breadth:this.breadth}).then(result=>{
            this.res=result;
        });
          
    }
    changeHandler(event){
        if(event.target.name=='length'){
            this.length=event.target.value;
        }
        else if(event.target.name=='breadth'){
            this.breadth = event.target.value;
        }
        else if(event.target.name=='side'){
            this.side = event.target.value;
        }
        else if(event.target.name=='radius'){
            this.radius = event.target.value;
        }
    }

}