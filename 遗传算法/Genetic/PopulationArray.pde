

class PopulationArray {
  ArrayList<Population> populations;  // Population
  ArrayList<Rocket> matingPool;    // ArrayList which we will use for our "mating pool"
  
  IntList lifecycles;          // Timer for cycle of generation
  int recordtime;         // Fastest time to target
  float mutationRate;
  int memberNum;
  
  int matingPoolMaxcount;    //最大数量
  
  ArrayList<PVector[]> maxFitnessTrail;  //适应度最高的火箭轨迹
  float maxFitnessAll;  //最高适应度
  int IniMaxFitness; //初始化最高适应度
  
  PopulationArray( float rateMutation, int numMember, int matingMaxcount ){
    
    lifecycles = new IntList();
    recordtime = -1;
    mutationRate = rateMutation;
    memberNum = numMember;
    
    populations = new ArrayList<Population>();
    matingPool = new ArrayList<Rocket>();
    matingPoolMaxcount = matingMaxcount;
    
    maxFitnessTrail = new ArrayList<PVector[]>();
    maxFitnessAll = 0;
    IniMaxFitness = 0;
  }
  
  void run( int timeMaxcount, ArrayList<Obstacle> obcs ) {
      if( (populations.size()<int(timeMaxcount/5)) && frameCount%5==0 ){
          populations.add( new Population(mutationRate, memberNum ) );
          lifecycles.append( 0 );
      }
    
      // If the generation hasn't ended yet
      for( int j=0; j<lifecycles.size(); j++ ){
        if (lifecycles.get(j) < timeMaxcount) {
          populations.get(j).live(obcs);
          if ((populations.get(j).targetReached()) && (lifecycles.get(j) < recordtime)) {
            recordtime = lifecycles.get(j);
          }
          lifecycles.add( j, 1 );
        // Otherwise a new generation
        } 
        else {
          lifecycles.set( j, 0 );
          populations.get(j).fitness();
          maxFitnessAll = max( maxFitnessAll, populations.get(j).getMaxFitness() );
          populations.get(j).selection( matingPool, matingPoolMaxcount, maxFitnessAll, maxFitnessTrail );
          if( matingPool.size() < 0 ){
            populations.set( j, new Population(mutationRate, memberNum ) );
          }
          else{
            populations.get(j).reproduction( matingPool );
          }
          if( IniMaxFitness>0 ){
            maxFitnessAll = 0;
            IniMaxFitness -= 1;
          }
        }
      }
    
    
  }
  
  ArrayList<PVector[]> getMaxFitnessTrail() {
    return maxFitnessTrail;
  }
  
  int getGenerations() {
    if( populations.size() >0 )  return populations.get(populations.size()-1).generations;
    else return -1;
  }
  
  int getLifecycle() {
    if( lifecycles.size() > 0 )   return lifecycles.get(lifecycles.size()-1);
    else return -1;
  }
  
  int getRecordtime() {
    return recordtime;
  }
  
  void setRecordtime( int timeRecord ) {
    recordtime = timeRecord;
  }
  
  void IniMaxFitness() {
    IniMaxFitness = lifecycles.size()+3;
  }
  
  
}
