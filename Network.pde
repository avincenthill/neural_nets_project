// Based on work from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Alex Vincent-Hill

// An animated drawing of a Neural Network

class Network {
  
  // The Network has a list of neurons
  ArrayList<Neuron> neurons;
  
  // The Network now keeps a duplicate list of all Connection objects.
  // This makes it easier to draw everything in this class
  ArrayList<Connection> connections;
  PVector position;

  Network(float x, float y) {
    position = new PVector(x, y);
    neurons = new ArrayList<Neuron>();
    connections = new ArrayList<Connection>();
  }

  // We can add a Neuron
  void addNeuron(Neuron n) {
    neurons.add(n);
  }

  // We can connection two Neurons
  void connect(Neuron a, Neuron b, float weight) {
    Connection c = new Connection(a, b, weight);
    a.addConnection(c);
    // Also add the Connection here
    connections.add(c);
  } 
  
  // Sending an input to the first Neuron
  // We should do something better to track multiple inputs
  void feedforward(float input) {
    Neuron start = neurons.get(0);
    start.feedforward(input);
  }
  
  // Update the animation
  void update() {
    for (Connection c : connections) {
      c.update();
    }
  }
  
  // Draw everything
  void display() {
    pushMatrix();

    translate(position.x, position.y);
    for (Neuron n : neurons) {
      text(n.sum, n.position.x - n.r/2, n.position.y - n.r*.75);
      n.display();
    }

    for (Connection c : connections) {
      c.display();
    }
    popMatrix();
  }
}