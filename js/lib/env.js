module.exports = {

  // Environments

  isDevelopment : function(){
    return this.getEnvironment() == "development";
  },

  isProduction : function(){
    return this.getEnvironment() == "production";
  },

  // Accessors

  getEnvironment : function(){
    return process.env.ENV || "development";
  },

  getPort : function(){
    return process.env.PORT || 9001;
  },

  getHostName : function(){
    return process.env.HOSTNAME || "localhost";
  },

  // Feature flags

  supportsAutoReload : function(){
    return this.isDevelopment();
  }
};

