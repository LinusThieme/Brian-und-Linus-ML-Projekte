

class Brain {
  
  private int InputSize;
  private ArrayList<Layer> hiddenLayers = new ArrayList<Layer>();
  
  //InputSize specifies how many input neurons there are, each integer in HiddenNeuronSize specifies how many neurons are in that layer, last element in HiddenNeuronSize is the Size of the output layer
  public Brain(int InputSize, int[] HiddenNeuronSize){
    
    //First HiddenLayer
    hiddenLayers.add(new Layer(InputSize, HiddenNeuronSize[0]));
    
    //Other HiddenLayers
    for(int i=1; i < HiddenNeuronSize.length; i++){
      hiddenLayers.add(new Layer(HiddenNeuronSize[i-1], HiddenNeuronSize[i]));
    }
    
  }
  
  public double[][] Think(double[][] InputNeurons){
    
    for(int i=0; i < hiddenLayers.size()-1; i++){
       InputNeurons = hiddenLayers.get(i).Forward(InputNeurons, true);
    }
    
    InputNeurons = hiddenLayers.get(hiddenLayers.size()-1).Forward(InputNeurons, false);
    
    return InputNeurons;
    
  }
  
  
}

class Layer {
  
  private double[][] Weights;
  private double[] Bias;
  
  private double[][] Neurons;
  
  private int NeuronsBefore;
  private int NeuronCount;
  
  public Layer(int NeuronsBefore, int Neurons){
    
    Weights = new double[Neurons][NeuronsBefore];
    Bias = new double[Neurons];
    
    for(int y=0; y < Neurons; y++){
      for(int x=0; x < NeuronsBefore; x++){
        Weights[y][x] = random(-1,1);
      }
    }
    
    for(int i=0; i < Neurons; i++){
       Bias[i] = random(-1, 1);
    }
    
    this.NeuronsBefore = NeuronsBefore;
    this.Neurons = new double[Neurons][1];
    NeuronCount = Neurons;
    
  }
  
  public double[][] Forward(double[][] Neurons, boolean activate){
    
    //Multiplication
    for(int i=0; i < Weights.length; i++){
      for(int j=0; j < 1; j++){
        for(int k=0; k < Weights[0].length; k++){
          this.Neurons[i][j] += Weights[i][k] * Neurons[k][j];
        }
      }
    }
    
    //Bias
    for(int i=0; i < Bias.length; i++){
      this.Neurons[i][0] += Bias[i];
    }
    
    //TanH Activation
    if(activate){
      for(int i=0; i < this.Neurons.length; i++){
        this.Neurons[i][0] = 2*(1/(1+exp(-(float)this.Neurons[i][0])))-1;
      }
    }
    
    return this.Neurons;
    
  }
  
}
