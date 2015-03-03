class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.cargo.rol == "Admin"
        if user.cargo.privilegioVer == true
            can :read, :all
        end
        if user.cargo.privilegioEditar == true
            can :update, :all
        end
        if user.cargo.privilegioEleminar == true
            can :destroy, :all
        end
        if user.cargo.privilegioCrear == true
            can :create, :all
        end
    else
        if user.cargo.rol = "Usuario"
            if user.cargo.privilegioVer == true
                can :read, Reintegro
                can :read, Traspaso
                can :read, Cuentadante
                can :read, Elemento
                can :read, Event
                can :read, Tipo_doc
                can :read, Tipo_elem
            end
            if user.cargo.privilegioEditar == true
                can :update, Elemento
            end
            if user.cargo.privilegioCrear == true
                can :create, Cuentadante
            end
        end
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
